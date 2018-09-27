document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
const placeListSubmit = (e) => {
  e.preventDefault();
  const placeListInput = document.querySelector(".favorite-input");
  const place = placeListInput.value;
  placeListInput.value = "";

  const ul = document.getElementById("sf-places");
  const li = document.createElement("li");
  li.textContent = place;
  ul.appendChild(li);

};

const placeListButton = document.querySelector(".favorite-submit");
placeListButton.addEventListener("click", placeListSubmit);


  // adding new photos

  // --- your code here!

  const photoFormToggle = (e) => {
    e.preventDefault();

    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === 'photo-form-container') {
      photoForm.className = "photo-form-container hidden";
    } else {
      photoForm.className = "photo-form-container";
    }
  };

  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", photoFormToggle);


  const photoSubmit = (e) => {
    e.preventDefault();

    let photoUrlInput = document.querySelector('.photo-url-input');
    let photourl = photoUrlInput.value;
    photoUrlInput.value = '';

    let newImg = document.createElement('img');
    let newLi = document.createElement('li');
    newImg.src = photourl;
    newLi.appendChild(newImg);

    let dogPhotoList = document.querySelector(".dog-photos");
    dogPhotoList.appendChild(newLi);

  };

  const photoSubmitButton = document.querySelector('.photo-url-submit');
  photoSubmitButton.addEventListener("click", photoSubmit);

});
