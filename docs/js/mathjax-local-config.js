/* Set local configuration for mathjax */

/* Set local configuration for mathjax */

MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
      processEscapes: true
    },
    "HTML-CSS": { availableFonts: ["TeX"] }
  });

/* Add line numbers by default */

MathJax.Hub.Config({
  TeX: { equationNumbers: { autoNumber: "AMS" } }
});
