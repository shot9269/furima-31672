document.addEventListener("DOMContentLoaded", function(){
  const ImageList = document.getElementById("image-list");
  document.getElementById("item-image").addEventListener("change",function(e){
    const ImageContent = document.querySelector("img")
    if (ImageContent){
      ImageContent.remove()
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.style.height = "20vh";

      imageElement.appendChild(blobImage);

      ImageList.appendChild(imageElement);
  });
});
