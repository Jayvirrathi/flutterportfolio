'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "087ec0dd313fbb51f56e5bbd34eb15c0",
"index.html": "d909a62f1d1f02d413c975fc4fce1940",
"/": "d909a62f1d1f02d413c975fc4fce1940",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/Jayvir.jpg": "6c469445dfa8ef84d155ff585b7d50ea",
"assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"assets/jayvir2.jpg": "3b5c1dafd99a6397b043d56515bdd9a6",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "6c5dcda57f8b678cd5387fe039d6ac64",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"main.dart.js": "49b706dc07d3f98542ded6ef30fd0ea0"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
