TYPE ConveyerType:
STRUCT
	// Коробка на конце ленты (от оптического датчика)
	BoxOnEndPosition: BOOL := FALSE;
	// Команда на вращение ленты
	ComRotateLent: BOOL := FALSE;
END_STRUCT
END_TYPE