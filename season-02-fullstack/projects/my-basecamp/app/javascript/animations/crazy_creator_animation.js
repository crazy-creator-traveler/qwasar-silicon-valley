// For more info about Lottie > https://airbnb.io/lottie
import "lottie"
const animation = bodymovin.loadAnimation({
  // Setting the ID for the 'getElementById' function, which will be used in the html markup for animation.
  container: document.getElementById('crazy-creator-animation'),

  renderer: 'svg',
  loop: true,
  autoplay: true,
  path: 'https://assets6.lottiefiles.com/packages/lf20_rb69zrkk.json'
})
