TYPE ConveyorType:
STRUCT
	// Коробка в начале ленты (от оптического датчика)
	BoxOnStartPosition: BOOL := FALSE;
	// Коробка на конце ленты (от оптического датчика)
	BoxOnEndPosition: BOOL := FALSE;
	// Команда на вращение ленты
	ComRotateBelt: BOOL := FALSE;
END_STRUCT
END_TYPE