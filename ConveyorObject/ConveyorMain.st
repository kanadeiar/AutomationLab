FUNCTION_BLOCK ConveyorMain
VAR
    data: ConveyorType;
    dev: Conveyer1;
    hard: Hardware;
    interf: HMIInterface;
END_VAR

// ============================================
// ТЕХНОЛОГИЧЕСКИЙ ОБЪЕКТ КОНВЕЙЕР
// ============================================

// Устройство: технологическая логика управления лентой
dev(Data:= data);

// Аппаратура: чтение датчиков, запись на двигатель
hard(SensorA:= GVL.DI_SensorA, SensorB:= GVL.DI_SensorB, ComMotor=> GVL.DO_ComMotor, Data:= data);

// HMI: интерфейс с панелью оператора
interf(Data:= data);


