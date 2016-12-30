$(document).ready(function() {
  getPhotos();
});

function getPhotos() {
  console.log("getting photos");
  $.getJSON("api/v1/photos")
   .then(renderPhotos);
}

function renderPhotos(data) {
  console.log("rendering photos");
  data.forEach(renderPhoto);
}

function renderPhoto(photo) {
  var html = '<div class="col s12 m3 l4">';
  html += '<div class="card small">';
  html += '<div class="card-image">';
  html += '<a href="photos/' + photo.id + '">';
  html += '<img src="' + photo.photo.url + '">';
  html += '</a>';
  html += '<span class="card-title">' + photo.title + '</span>';
  html += '</div>';
  html += '<div class="card-content">';
  html += '<p>' + photo.caption + '</p>';
  html += '</div>';
  html += '</div>';
  html += '</div>';
  $(".past-photos-of-the-day").append(html);
}
