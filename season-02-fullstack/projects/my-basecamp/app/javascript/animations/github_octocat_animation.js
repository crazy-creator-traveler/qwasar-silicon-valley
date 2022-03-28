// For more info about Lottie > https://airbnb.io/lottie
import "lottie"
const animation = bodymovin.loadAnimation({
  // Setting the ID for the 'getElementById' function, which will be used in the html markup for animation.
  container: document.getElementById('github-octocat-animation'),
 
  renderer: 'svg',
  loop: true,
  autoplay: true,
  path: 'assets/animations/github_octocat_animation.json'
})
