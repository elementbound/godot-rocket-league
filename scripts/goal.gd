extends Area3D

var _logger := NetfoxLogger.new("rocket", "Goal")

func _ready():
	NetworkRollback.on_process_tick.connect(on_rollback_tick)

func on_rollback_tick(tick : int) -> void:

	for body in get_overlapping_bodies():
		if body is Ball:
			_logger.debug("Ball in goal!")
			body.entered_goal_area(self, tick)
