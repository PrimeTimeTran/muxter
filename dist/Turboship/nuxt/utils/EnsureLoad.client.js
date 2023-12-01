export function loadJS(url) {
  var async = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;
  var loaded = null;
  function loadFile() {
    try {
      var scriptEle = document.createElement('script');
      scriptEle.setAttribute('src', url);
      scriptEle.setAttribute('type', 'text/javascript');
      scriptEle.setAttribute('async', async);
      document.body.appendChild(scriptEle);
      scriptEle.addEventListener('load', function () {
        console.log('Loaded!');
        if (url === scriptUrls.hotkeys) setupHotkeys();
        loaded = true;
      });
      scriptEle.addEventListener('error', function (ev) {
        console.log('Error on loading file', ev);
        loaded = false;
        retryLoad();
      });
    } catch (error) {
      console.log('Failed to load', error);
      retryLoad();
    }
  }
  function retryLoad() {
    if (!loaded) {
      console.log('Retrying load...');
      setTimeout(loadFile, 1000);
    } else {
      console.log('Load successful');
    }
  }
  loadFile();
}
export var scriptUrls = {
  chart: 'https://unpkg.com/hotkeys-js@3.12.0/dist/hotkeys.min.js',
  hotkeys: 'https://unpkg.com/hotkeys-js@3.12.0/dist/hotkeys.min.js'
};
export function ensureLoad(url) {
  if (!process.browser) return;
  console.log('Ensuring load: ', url);
  if (url === scriptUrls.chart && typeof hotkeys === 'undefined') {
    loadJS(url);
  } else if (typeof hotkeys !== 'undefined') {
    setupHotkeys();
  } else {
    loadJS(url);
  }
}