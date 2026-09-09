FUNCTION_BLOCK MainConveyer_FB
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
    // Данные конвейера (каталог объекта)
    data: ConveyerType;
    // Алгоритмический блок обработки конвейера
    conveyer: Conveyer_FB;
    // Блок сопряжения с аппаратурой
    hardware: Conveyer_Hardware_FB;
    // Блок интерфейса пульта оператора
    hmi: Conveyer_HMI_FB;
END_VAR

// Циклическое выполнение алгоритма
conveyer(Data := data);

// Подключение блока хардвар
hardware(Data := data);

// Подключение блока интерфейса
hmi(Data := data);

