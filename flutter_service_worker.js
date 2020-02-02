'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "dec741e31a94e79355b057474ee5e510",
"/main.dart.js": "773cf766eb71f9725c960d160b44dffb",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "284a3b760101d15241af6a9378e8223b",
"/assets/LICENSE": "a4d02d2f3b5a78ee1ea8be24257fad70",
"/assets/AssetManifest.json": "b48ced81ec37ab0864551c851abca8ae",
"/assets/FontManifest.json": "58ad8b1d108e353e3920779acccae48a",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/Bangers-Regular.ttf": "a82040ecf06139df2f3e653326b3420c"
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
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
