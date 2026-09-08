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
END_VAR

// Циклическое выполнение алгоритма
conveyer(Data := data);

