# name: iec61131-st-codesys
# description: Навык работы с языком ST (Structured Text) по МЭК 61131-3, CoDeSys v3

> Все примеры кода — справочные. Используй только те паттерны, которые нужны в твоём проекте.

## Язык ST (Structured Text) — МЭК 61131-3

### Синтаксис
- Ключевые слова: `PROGRAM`, `FUNCTION_BLOCK`, `FUNCTION`, `VAR`, `END_VAR`, `BEGIN`, `END_PROGRAM`
- Комментарии: `// однострочный` и `(* многострочный *)`
- Разделитель инструкций: `;` (точка с запятой)
- Присваивание: `:=` (не `=`)
- Сравнение: `=`, `<>`, `<`, `>`, `<=`, `>=`
- Логические: `AND`, `OR`, `NOT`, `XOR`
- Арифметика: `+`, `-`, `*`, `/`, `MOD`

### Базовые типы данных

| Тип | Диапазон | Размер |
|-----|----------|--------|
| `BOOL` | TRUE / FALSE | 1 бит |
| `BYTE` | 0..255 | 8 бит |
| `WORD` | 0..65535 | 16 бит |
| `DWORD` | 0..4294967295 | 32 бит |
| `SINT` | -128..127 | 8 бит |
| `INT` | -32768..32767 | 16 бит |
| `DINT` | -2147483648..2147483647 | 32 бит |
| `LINT` | -2^63..2^63-1 | 64 бит |
| `USINT` | 0..255 | 8 бит |
| `UINT` | 0..65535 | 16 бит |
| `UDINT` | 0..4294967295 | 32 бит |
| `ULINT` | 0..2^64-1 | 64 бит |
| `REAL` | ±3.4E±38 | 32 бит (IEEE 754) |
| `LREAL` | ±1.7E±308 | 64 бит (IEEE 754) |
| `TIME` | T#ms .. T#days | 32 бит |
| `DATE` | D#yyyy-mm-dd | — |
| `TIME_OF_DAY` | TOD#hh:mm:ss | — |
| `DT` | DT#yyyy-mm-dd-hh:mm:ss | — |
| `STRING` | до 254 символов | — |
| `WSTRING` | Unicode строки | — |
| `ARRAY` | Массивы | — |
| `STRUCT` | Структуры | — |

### Типизированные константы
```st
10      : INT;       // целочисленная
3.14    : REAL;      // вещественная
T#5s    : TIME;     // время
TRUE    : BOOL;      // логическая
"Hello" : STRING;   // строка
```

### Операторы

#### Условные
```st
IF condition THEN
    // тело
ELSIF other_condition THEN
    // тело
ELSE
    // тело
END_IF;

CASE variable OF
    1: // вариант 1;
    2: // вариант 2;
    10..20: // диапазон;
    ELSE // по умолчанию;
END_CASE;
```

#### Циклы
```st
FOR counter := 1 TO 10 BY 1 DO
    // тело
END_FOR;

WHILE condition DO
    // тело
END_WHILE;

REPEAT
    // тело
UNTIL condition
END_REPEAT;

// Бесконечный цикл в PROGRAM
WHILE TRUE DO
    // тело
END_WHILE;
```

#### Массивы и структуры
```st
(* Объявление структуры *)
TYPE MyStruct :
STRUCT
    Value     : INT;
    Active    : BOOL;
    Timestamp : TIME;
END_STRUCT
END_TYPE

(* Массив *)
VAR
    data : ARRAY[1..10] OF INT;
    item : MyStruct;
END_VAR

data[1] := 100;
item.Value := 50;
```

#### FUNCTION_BLOCK — объявление
```st
FUNCTION_BLOCK FB_Conveyor
VAR_INPUT
    Start: BOOL;
    Stop: BOOL;
    Speed: REAL;
END_VAR

VAR_OUTPUT
    Running: BOOL;
    Fault: BOOL;
END_VAR

VAR
    timerStart: TON;
    state: INT;
END_VAR

BEGIN
    (* Логика блока *)
END_FUNCTION_BLOCK
```

#### Вызов FB с использованием экземпляров
```st
(* Объявление экземпляра *)
VAR
    conveyor1: FB_Conveyor;
    timer1: TON;
END_VAR

(* Вызов — как функцию *)
conveyor1(
    Start := GVL.Btn_Start,
    Stop := GVL.Btn_Stop,
    Speed := GVL.Speed_Setpoint,
    RunCommand => GVL.Command,
);
```

### CoDeSys v3 — стандартные библиотеки

#### Арифметика
| Функция | Описание |
|-----|----------|
| ABS(x) | Модуль |
| SQRT(x) | Квадратный корень |
| EXP(x) | Экспонента e^x |
| LN(x) | Натуральный логарифм |
| LOG(x) | Десятичный логарифм |
| SIN(x), COS(x), TAN(x) | Тригонометрия |
| ATAN2(y, x) | Арктангенс |

#### Преобразование типов
| Функция | Описание |
|-----|----------|
| TO_REAL(x) | INT/DINT → REAL |
| TO_INT(x) | REAL → INT (округление к нулю) |
| TO_DINT(x) | REAL → DINT |
| TRUNC(x) | REAL → DINT (отброс дробной) |
| ADR(x) | Адрес переменной |
| SIZEOF(x) | Размер в байтах |
| LENGTH(x) | Длина строки |

#### Строковые
| Функция | Описание |
|-----|----------|
| LEN(str) | Длина строки |
| LEFT(str, n) | n символов слева |
| RIGHT(str, n) | n символов справа |
| MID(str, pos, n) | n символов с позиции |
| CONCAT(a, b) | Конкатенация |
| FIND(str, sub) | Позиция подстроки |
| LEFT_STR(str, n) | Левые символы |

### CoDeSys Control — таймеры и счётчики

#### TON — Таймер задержки включения
```st
VAR
    timer : TON;
END_VAR

timer(IN := StartSignal, PT := T#5s, Q => Done);
(* Done — таймер истёк *)
(* timer.PT — заданное время *)
```

#### TOF — Таймер задержки выключения
```st
VAR
    timer : TOF;
END_VAR

timer(IN := Signal, PT := T#3s, Q => DoneSignal);
(* DoneSignal — сигнал пока не истекло *)
```

#### TP — Таймер импульса
```st
VAR
    timer : TP;
END_VAR

timer(IN := Pulse, PT := T#1s, Q => GoingPulse);
(* GoingPulse — импульс длительностью PT *)
```

#### CTU — Счётчик вверх
```st
VAR
    counter : CTU;
END_VAR

counter(CU := Pulse, RESET := Reset, PV := 100, Q => Done);
(* Done — достиг PV *)
(* counter.CV — текущее значение *)
```

#### CTD — Счётчик вниз
```st
VAR
    counter : CTD;
END_VAR

counter(CD := Pulse, LD := Load, PV := 100, Q => Done);
(* Done — достиг PV *)
(* counter.CV — текущее значение *)
```

### CoDeSys v3 — адресация
```st
(* CoDeSys — через глобальные переменные VAR_GLOBAL и AT *)
VAR
    Input_Sensor : BOOL AT %IX0.0;
    Output_Motor : BOOL AT %QX0.0;
    Memory_Reg : INT AT %MW10;
END_VAR
```

#### Цикловое выполнение
```st
(* MainTask — цикл выполнения *)
(* PRESCAN: один раз при старте *)
(* MAIN_CYCLE: каждый цикл сканера *)
(* POSTSCAN: в конце цикла *)

(* Период сканера: Project → Task Configuration *)
(* Task: cyclic, 10ms (рекомендуется) *)
```

### Архитектурные паттерны CoDeSys v3
#### 1. Организация проекта
```st
Project/
├── <Технологический объект>/
│   ├── ConveyerMain.st         ← Главный блок технологического объекта
│   ├── ConveyerObjectType.pou  ← Тип данных о конвейерах объекта
│   └── <Модель управления технологической логикой>/
│       ├── ConveyerType.pou    ← Тип данных о одном конвейера    
│       ├── Conveyer1.st     ← Технологический объект конвейера 1
│       └── Conveyer2.st     ← Технологический объект конвейера 2       ├── 
├── <Логика управления>/
│   ├── AlwaysOn.st     ← Логика работы всегда влючить при разрешении
│   └── OnOffWork.st    ← Логика работы работать от включения и до отключения
├── <Вспомогательное>/
│   ├── HW_Hardware.st     ← Абстракция аппаратуры, железа
│   └── HMI_Interface.st   ← Данные физическому миру - кнопкам, лампочкам и сенсорной панели оператора
├── <Главная программа>.st ← Главный циклический вызов
└── GVL.st                 ← Глобальные переменные, ввода/вывода CoDeSys
```

#### 2. Глобальная переменная (GVL)
```st
(* GVL.st — ОДИН экземпляр, RETAIN *)
VAR_GLOBAL CONSTANT
    SETTING1_TIME      : TIME := T#10ms;
END_VAR

VAR_GLOBAL RETAIN
    (* Состояние системы — сохраняется при отключении *)
    SystemState     : INT;
END_VAR

VAR_GLOBAL
    (* Мгновенные данные — сбрасываются при старте *)
	SensorA:BOOL;
	SensorB:BOOL;
	SwRotate:BOOL;
	MotorConveyer1:BOOL;
	MotorConveyer2:BOOL;
END_VAR
```

#### 3. Главный блок техологического объекта
```st
PROGRAM ConveyerMain
VAR
	ObjectData: ConveyerObjectType;
	HW_Handler: HW_Hardware;
	HMI_Handler: HMI_Interface;
	Conveyer1: Conveyer1_FB;
	Conveyer2: Conveyer2_FB;
END_VAR

BEGIN

    (* Чтение входов - запись выходов / Абстракция аппаратной части, железа *)
    Hardware(
        SensorA:= GVL.SensorA, 
        SensorB:= GVL.SensorB, 
        MotorLent1=> GVL.MotorConveyer1, 
        MotorLent2=> GVL.MotorConveyer2, 
        Conveyer1:= ObjectData.Conveyer1, 
        Conveyer2:= ObjectData.Conveyer2);

    (* Запись в панель оператора, лампы и чтение кнопок *)
    HMIInterface(
        SwRotate:= GVL.SwRotate, 
        Conveyer1:= ObjectData.Conveyer1);
        
    (* Технологический блок конвейера 1 *)
    Conveyer1(
        SwRotate:= ObjectData.Conveyer1.SwRotating, 
        RotateLent=> ObjectData.Conveyer1.ComRotateLent);

    (* Технологический блок конвейера 2 *)
    Conveyer2(
        BoxOnInput:= ObjectData.Conveyer2.SensorInput, 
        BoxOnOutput:= ObjectData.Conveyer2.SensorOutput, 
        RotateLent=> ObjectData.Conveyer2.ComRotateLent);

END_PROGRAM
```

#### 4. Главный блок программы
```st
PROGRAM PLC_PRG
VAR
	conveyer: ConveyerMain;
END_VAR

BEGIN

    (* Технологический объект - конвейер *)
    conveyer();

END_PROGRAM
```

#### 5. Паттерн состояния (State Machine)
```st
FUNCTION_BLOCK FB_StateMachine
VAR_INPUT
    Reset       : BOOL;
    Run         : BOOL;
END_VAR

VAR_OUTPUT
    CurrentState: INT;
    Done        : BOOL;
    Error       : BOOL;
END_VAR

VAR
    state       : INT := 0;
END_VAR

BEGIN
    IF Reset THEN
        state := 0;
        Done := FALSE;
        Error := FALSE;
    ELSIF Run THEN
        CASE state OF
            0: (* Idle *)
                state := 1;
            1: (* Start *)
                state := 2;
            2: (* Running *)
                IF DoneCondition THEN
                    state := 3;
                END_IF;
            3: (* Stop *)
                state := 0;
        END_CASE;
    END_IF;
    
    CurrentState := state;
END_FUNCTION_BLOCK
```

### Частые ошибки и антипаттерны
#### Плохо
```st
(* 1. Прямая адресация в логике *)
IF %IX0.0 THEN ... END_IF;

(* 2. Нет RETAIN для сохраняемых данных *)
VAR
    Counter : INT;  // сбросится при отключении!
END_VAR

(* 3. Вызов FB без экземпляра *)
FB_Conveyor(Start := TRUE);  // ОШИБКА!

(* 4. Мутация входных параметров *)
VAR_INPUT
    Speed : REAL;
END_VAR
Speed := Speed * 0.5;  // ОШИБКА!
```

#### Хорошо
```st
(* 1. Символическая адресация в GVL *)
IF GVL.DI_Sensor_Activated THEN ... END_IF;

(* 2. RETAIN для сохраняемых данных *)
VAR_GLOBAL RETAIN
    Counter : INT;  // сохраняется
END_VAR

(* 3. Экземпляр FB *)
VAR
    conveyor : FB_Conveyor;
END_VAR
conveyor(Start := TRUE);

(* 4. Локальная копия для мутации *)
VAR
    localSpeed : REAL;
END_VAR
localSpeed := Speed * 0.5;
```


