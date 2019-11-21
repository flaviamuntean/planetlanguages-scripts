const copyClipboard = () => {
  const clipboard = new ClipboardJS('.copy-btn');
  clipboard.on('success', function(e) {
      console.log(e);
      e.clearSelection();
      const copyBtn = document.querySelector('.copy-btn');
      copyBtn.innerText = "Copied!";
      copyBtn.blur();
      setTimeout(function() {
          copyBtn.innerText = "Copy"
      }, 2e3)
  });
  clipboard.on('error', function(e) {
      console.log(e);
  });
}

export {copyClipboard};
