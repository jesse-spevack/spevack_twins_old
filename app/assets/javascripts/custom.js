$(document).ready(function() {
  getPhotos();
});

function getPhotos() {
  console.log("getting photos")
  $.getJSON("api/v1/photos")
   .then(renderPhotos);
}

function renderPhotos(data) {
  console.log("rendering photos")
  data.forEach(renderPhoto);
}

function renderPhoto(photo) {
  var html = `
        <div class="col s12 m3 l4">
          <div class="card small">
            <div class="card-image">
              <a href="photos/${photo.id}">
              <img src="${photo.photo.url}">
              </a>
              <span class="card-title">${photo.title}</span>
            </div>
            <div class="card-content">
              <p>${photo.caption}</p>
            </div>
          </div>
        </div>`
  $(".past-photos-of-the-day").append(html);
}
