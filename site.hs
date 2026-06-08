{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Monoid         (mappend)
import           Hakyll
import           Text.Pandoc.Options

main :: IO ()
main = hakyll $ do
    -- Static assets ---------------------------------------------------------
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "js/*" $ do
        route   idRoute
        compile copyFileCompiler

    -- Standalone pages ------------------------------------------------------
    match "about.md" $ do
        route   $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- Notes -----------------------------------------------------------------
    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    -- Archive listing -------------------------------------------------------
    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archive"             `mappend`
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    -- Home ------------------------------------------------------------------
    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

-- Context shared by every note --------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

-- Pandoc compiler with LaTeX math rendered by MathJax ---------------------
pandocMathCompiler :: Compiler (Item String)
pandocMathCompiler =
    let mathExtensions =
            [ Ext_tex_math_dollars
            , Ext_tex_math_double_backslash
            , Ext_latex_macros
            ]
        defaultExtensions = writerExtensions defaultHakyllWriterOptions
        newExtensions     = foldr enableExtension defaultExtensions mathExtensions
        writerOptions     = defaultHakyllWriterOptions
            { writerExtensions     = newExtensions
            , writerHTMLMathMethod = MathJax ""
            }
    in pandocCompilerWith defaultHakyllReaderOptions writerOptions
