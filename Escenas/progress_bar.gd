extends ProgressBar




func ActualizarBarra(max: float, actual: float):
	self.value = actual/(max*1.0)
	print(actual)
