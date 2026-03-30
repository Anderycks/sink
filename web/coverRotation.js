/*
 * Rotate publication cover images.
 *
 * After the page loads, replace the publication cover image
 * with a random one, which changes the color of the site.
 */
const COVER_DIV_CLASS = "site-header-cover";
const COVER_IMGS = [
    "publication-cover-purple-blue.png",
    "publication-cover-green-yellow.png",
    "publication-cover-purple-pink.png",
    "publication-cover-pink-purple.png",
    "publication-cover-yellow-green.png",
    "publication-cover-blue-purple-1.png"
];
document.addEventListener("DOMContentLoaded", (event) => {
    const randomIndex = Math.floor(Math.random() * 6);
    const coverImg = COVER_IMGS[randomIndex];
    const coverSrcSet = `/content/images/size/w300/2024/04/${coverImg} 300w, /content/images/size/w600/2024/04/${coverImg} 600w, /content/images/size/w1000/2024/04/${coverImg} 1000w, /content/images/size/w2000/2024/04/${coverImg} 2000w`;
    const coverSrc = `/content/images/size/w2000/2024/04/${coverImg}`;
    const img = document.getElementsByClassName(COVER_DIV_CLASS)[0];
    img.src = coverSrc;
    img.srcset = coverSrcSet;
});
