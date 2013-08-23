class Main

	stage 			: null
	renderer 		: null
	dt 				: 0
	lastTime 		: 0

	constructor:()->		
		@stage = new PIXI.Stage(0x000000, true)
		@renderer = PIXI.autoDetectRenderer(1152, 672, null)
		@renderer.view.style.display = "block"
		@renderer.view.className = "gameRenderer"
		# @renderer.view.style.cursor = "../img/pen.png"
		$("#container").append(@renderer.view)
				
		SceneTraveler.getInstance().travelTo(new LoadScene(@stage))

		@lastTime = Date.now()

		requestAnimFrame( @animate )
		return

	animate:()=>
		requestAnimFrame( @animate )
		@renderer.render( @stage )
		t = Date.now()
		dt = t - @lastTime
		@lastTime = t

		Game.instance.update(dt)

		return

main = null
$(document).ready ->
	main = new Main()
	return