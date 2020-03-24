
function hiba() {
    window.alert("Hibás felhasználónév, vagy jelszó");
    console.log('műxika ');
}



function ellenorzes(mezo1, mezo2) {
    console.log('lefordula a script');
    if (mezo1.value === "")
    {
        alert("Felhasználónév megadása közelező!");
    } else if (mezo2.value === "") {
        alert("Jelszó megadása kötelező");
    }

}