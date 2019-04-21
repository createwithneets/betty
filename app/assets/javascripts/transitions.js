$("#navbar a").on("click", function(event){

event.preventDefault()

const href = $(this).attr("href")

window.history.pushState(null, null, href)

$("#navbar a").removeClass("active")
$(this).addClass("active")

$.ajax({
  url: href,
  success: function (data) {
    $("section").fadeOut(250, function () {
      const newPage = $(data).filter(".loadin").html()

      $("section").html(newPage)

      $("section").fadeIn(250)
    }
  }
})


})
