FUNCTION_BLOCK ConveyorMain
VAR
    hardIn: HardwareInput;
    logic: LogicDevice;
    hardOut: HardwareOutput;
    hmi: HMIInterface;
END_VAR

// ============================================
// ЧИСТЫЙ ОРКЕСТРАТОР КОНВЕЙЕРА
// ============================================
// НЕ ИСПОЛЬЗУЕТ GVL. Только соединяет блоки:
// Hardware -> LogicDevice -> HardwareOutput -> HMIInterface
// ============================================

// Шаг 1: Hardware читает датчики из GVL -> BoxOnStart/BoxOnEnd
hardIn();

// Шаг 2: LogicDevice вычисляет команду (RS-триггер с самоподхватом)
logic(BoxOnStart:= hardIn.BoxOnStart,
      BoxOnEnd:= hardIn.BoxOnEnd);

// Шаг 3: HardwareOutput пишет команду на двигатель в GVL
hardOut(ComRotate:= logic.ComRotate);

// Шаг 4: HMIInterface зажигает лампочку на панели
hmi(BeltRun:= logic.ComRotate);


