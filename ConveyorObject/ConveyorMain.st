FUNCTION_BLOCK ConveyorMain
VAR
    logic: LogicDevice;
    hard: Hardware;
    hmi: HMIInterface;
END_VAR

// ============================================
// ЧИСТЫЙ ОРКЕСТРАТОР КОНВЕЙЕРА
// ============================================
// НЕ ИСПОЛЬЗУЕТ GVL. Только соединяет блоки:
// Hardware -> LogicDevice -> HMIInterface
// ============================================

// Шаг 1: Hardware читает сигналы и пишет команду на двигатель
hard(ComRotate:= logic.ComRotate);

// Шаг 2: LogicDevice вычисляет команду (RS-триггер с самоподхватом)
logic(BoxOnStart:= hard.BoxOnStart,
      BoxOnEnd:= hard.BoxOnEnd);

// Шаг 3: HMIInterface зажигает лампочку на панели
hmi(BeltRun:= logic.ComRotate);


