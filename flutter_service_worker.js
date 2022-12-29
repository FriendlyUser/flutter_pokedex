'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "1773b696beef413dc78b80b350b61e48",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"manifest.json": "6f4ad28010f5b97885a155adb27be2d6",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"assets/AssetManifest.json": "e6ea204f4cee1ba8f0abbdc825c5a5ff",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "33f9d76729fc3dd45e72e253962d2282",
"assets/assets/clean_pokemon.json": "4ab719b1cc5ea37b7e253dee8f9f72aa",
"assets/assets/images/img_frame17_5.svg": "4c6414f3e682c8b700369eaf9584740f",
"assets/assets/images/img_image10.png": "4feaa9f82873c35e7d97a7dbb6e01190",
"assets/assets/images/img_image13.png": "7674ace1838772e108dc192dac61dc63",
"assets/assets/images/img_image16.png": "d0c2343b9f7dac71e0f467b83b0372c8",
"assets/assets/images/image_not_found.png": "a88029aaad6e6ea7596096c7c451840b",
"assets/assets/images/img_frame17_6.svg": "e7945ca0950c994e3cda2bfa936cda19",
"assets/assets/images/img_image14.png": "1a04e104abac331a3ea66c21f9c2b54c",
"assets/assets/images/img_image17.png": "94c5b672d8d370ac07f4d781e6b81187",
"assets/assets/images/img_frame17_4.svg": "6592e8f236a560261b152441b97aa2b7",
"assets/assets/images/img_image15.png": "c58a9a675d4387f1cd390c052de6c692",
"assets/assets/images/img_image12.png": "9045a75bc32a51a1aa15f10a51b74e5e",
"assets/assets/images/img_music.svg": "858d9fa20e81b1fa00b10d3f28df7e79",
"assets/assets/images/img_image9.png": "22415d17bb8d62c22830f4650c9b838c",
"assets/assets/images/img_frame17_100x231.svg": "c1eb4604a4c74daae40c5f95a40bbd40",
"assets/assets/images/img_frame17_2.svg": "d4a7af8ec2750bf3c1e94aef376a2d04",
"assets/assets/images/img_frame.svg": "7e67e3a0f12ce944350e04e77c2f1d8b",
"assets/assets/images/img_frame17_3.svg": "c957199d987fb598564758e4ba734084",
"assets/assets/images/img_frame17_1.svg": "37769dede49ca2c40936dafcbaf8e99e",
"assets/assets/images/img_frame51.svg": "3a087693692bee9753918c5183c68899",
"assets/assets/images/img_arrowright.svg": "bb7afdb7c9220464fbdac541d27c4519",
"assets/assets/images/img_frame17.svg": "cb67fbd9f41b81ba3d5b6b9a42b4930f",
"assets/assets/images/img_frame17_7.svg": "2dacfcd58265275b0a22cc9b7529bab6",
"assets/assets/images/img_group7.svg": "c38d576bc67042716b3231b39142b101",
"assets/assets/images/img_image11.png": "1ab1952348620a9b71eb84fb5dc8cc37",
"assets/assets/images/img_arrowleft.svg": "41ea046d002f81db6bb197236115e42b",
"assets/assets/fonts/PoppinsBold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/PoppinsRegular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/NOTICES": "c17b4fa32ceecddedb3706e8a920cda1",
"index.html": "0c16284de80958ea87e93977057a9769",
"/": "0c16284de80958ea87e93977057a9769",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "0860c149387a12adb67531442b5eb75e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
