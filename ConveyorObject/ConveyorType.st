TYPE ConveyorType:
STRUCT
	// Коробка на конце ленты (от оптического датчика)
	BoxOnEndPosition: BOOL := FALSE;
	// Команда на вращение ленты
	ComRotateBelt: BOOL := FALSE;
END_STRUCT
END_TYPE