class DataManager

	@instance 		= new DataManager()
	
	datas			: null
	urlList			: null
	loadCount		: 0

	onComplete		: null

	constructor:()->
		if DataManager.instance then throw new Error("You can t create an instance of DataManager")
		
		@datas = {}
		@loadCount = 0
		
		return


	load:(@urlList,@onComplete=null)->

		@loadCount += urlList.length
				
		for url in urlList
			img = new Image()
			img.onload = @onLoaded
			img.src = url 
			@datas[url] = img 
		
		return


	onLoaded:()->
		dm = DataManager.instance
		dm.loadCount--
		if dm.loadCount == 0 and dm.onComplete != null
			dm.onComplete()


	get:(id)->
		return @datas[id]


	clean:()->
		@datas = {}
		return;