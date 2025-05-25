javascript:(function() {
  const suffix = prompt("Enter the Baidu Netdisk link suffix (e.g. /s/1abcDEFg)");
  if (!suffix) return;
  const pwd = prompt("Enter the extraction code (optional)");
  let url = "https://pan.baidu.com" + suffix;
  if (pwd) {
    url += "?pwd=" + encodeURIComponent(pwd);
  }
  window.open(url, "_blank");
})();