
const randomChoice = arr => {
  const randIndex = Math.floor(Math.random() * arr.length);
  return arr[randIndex];
}

function createVideo(src) {
  const video = document.createElement('video')
  video.src = src
  video.autoplay = true
  video.loop = true
  console.log(video)
  return video
}

fetch('https://api.giphy.com/v1/gifs/search?api_key=eipxVPIBTX70SlbQr7kR1gfTyOFM2wsR&q=friendship&limit=100&offset=0&rating=PG-13&lang=en').then(response => {
	// Convert to JSON
	return response.json();
}).then(json => {
  const gif = randomChoice(json.data)
  const src = gif.images.fixed_width.mp4
	console.log(src)

const video = createVideo(src)

  const videosEl = document.querySelector('.videos')
  videosEl.appendChild(video)
})


.catch(error => {

})
