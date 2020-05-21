#translated for https://www.reddit.com/r/godot/comments/gmx49s/i_made_an_automatic_2d_pixel_normal_calculator/
tool #to get the normal map set in the editor
extends Sprite

func _init():
	generate_normal_map() #gets called because of tool on init in the editor (as soon as you set this the scrrip tof the node)
	
func _ready():
	generate_normal_map()

func generate_normal_map():
	var data: Image = texture.get_data()
	data.lock()
	var size: Vector2 = data.get_size()
	for y in range(size.y):
		for x in range(size.x):
			var c : Color = data.get_pixel(x,y)
			var top = 2
			var left = 2
			var right = 2
			var bottom = 2
			if c.a >= 1.0:
					#explore top
				if y > 0:
					var topPixel = data.get_pixel(x, y - 1)
					if topPixel.a < 1.0:
						top = 0
					elif y > 1:
						topPixel = data.get_pixel(x, y - 2)
						if topPixel.a < 1.0:
							top = 1
				else:
					top = 0#
				#explore bottom
				if y < data.get_height() -1:
					#possible to explore
					
					var bottom_pixel = data.get_pixel(x, y + 1)
					if bottom_pixel.a < 1.0:
						bottom = 0
					elif y < data.get_height() -2:
						bottom_pixel = data.get_pixel(x, y + 2)
						if bottom_pixel.a < 1.0:
							bottom = 1
				else:
					bottom = 0
				#explore left
				if x > 0:				
					var left_pixel = data.get_pixel(x-1, y)
					if left_pixel.a < 1.0:
						left = 0
					elif x > 1:
						left_pixel = data.get_pixel(x - 2, y)
						if left_pixel.a < 1.0:
							left = 1
				else:
					left = 0
				
				#explore right
				if x < data.get_width() - 1:
					#possible to explore
					var right_pixel = data.get_pixel(x + 1, y)
					if right_pixel.a < 1.0:
						right = 0
					elif x < data.get_width() -2:
						right_pixel = data.get_pixel(x + 2, y)
						if right_pixel.a < 1.0:
							right = 1
				else:
					right = 0
				
				#create color -- -2 ~ +2
				var y_digit = -bottom + top
				var y_color = y_digit * 32 + 128
				var x_digit = -right + left
				var x_color = x_digit * 32 + 128
				var z_digit = max(abs(x_digit), abs(y_digit))
				var z_color = z_digit * -32 + 255
				var color = Color(float(x_color)/255, float(y_color)/255, float(z_color)/255)
				data.set_pixel(x, y, color)
					
				
				
		var tex = ImageTexture.new()
		tex.create_from_image(data)
		normal_map = tex
