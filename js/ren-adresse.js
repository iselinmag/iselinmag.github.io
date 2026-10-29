// Fjerner #seksjon fra adressefeltet etter at siden har scrollet dit,
// så adressen forblir ren (for eksempel iselinmagnussen.devdrop.dev/).
// Uten JavaScript virker lenkene som vanlig, bare med # i adressen.
(function () {
    function fjernHash() {
        if (window.location.hash) {
            history.replaceState(null, '', window.location.pathname + window.location.search);
        }
    }
    window.addEventListener('hashchange', fjernHash);
    window.addEventListener('load', function () {
        setTimeout(fjernHash, 0);
    });
})();
