// ============================================
// ФУНКЦИОНАЛЬНЫЙ БЛОК — управление конвейером
// ============================================
FUNCTION_BLOCK Conveyer1
VAR_INPUT
    SensorA: BOOL; // Сигнал с датчика
END_VAR
VAR_OUTPUT
    RotateLent: BOOL; // Команда вращения ленты
END_VAR
VAR
    DelayTon: TON; // таймер задержки срабатывания
    DelayTime: TIME := T#100ms; // время задержки
END_VAR

// задержка срабатывания блока
DelayTon(IN := NOT SensorA, PT := DelayTime, Q => RotateLent);

END_FUNCTION_BLOCK
