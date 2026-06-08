// MathJax configuration. Kept in a plain .js file (copied verbatim by Hakyll)
// rather than inline in templates/default.html, because Hakyll templates treat
// '$' as a field delimiter and would fail to parse the dollar-sign math config.
window.MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']],
    displayMath: [['$$', '$$'], ['\\[', '\\]']]
  },
  options: {
    skipHtmlTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
  }
};
