# Naming Convention

This convention uses camelCase for C++ code in this project.

## Variables

| Element                 | Convention   | Example                                     |
| ----------------------- | ------------ | ------------------------------------------- |
| Private member          | `mName`      | `mPayload`, `mType`, `mPriority`            |
| Public/protected member | `pName`      | `pCount`, `pStatus`                         |
| Parameter               | `tName`      | `tPayload`, `tType`, `tPriority`            |
| Local variable          | `nName`      | `nParsedValue`, `nNextState`, `nEventCount` |
| Static member           | `sName`      | `sInstance`, `sMutex`                       |
| Constant                | `kName`      | `kMaxPointCount`, `kDefaultPort`            |
| Enum value              | `PascalCase` | `None`, `Normal`, `High`                    |

## Functions

| Element         | Convention                | Example                                        |
| --------------- | ------------------------- | ---------------------------------------------- |
| Function/method | `camelCase`               | `setPayload()`, `getType()`, `dispatchEvent()` |
| Getter          | `getName()` or `isName()` | `getType()`, `isRunning()`                     |
| Setter          | `setName()`               | `setType()`, `setPriority()`                   |

## Types

| Element      | Convention   | Example                      |
| ------------ | ------------ | ---------------------------- |
| Class/struct | `PascalCase` | `Event`, `EventDispatcher`   |
| Enum class   | `PascalCase` | `EventType`, `EventPriority` |
| Namespace    | `PascalCase` | `EventSystem`, `Utility`     |

## Example

```cpp
class Event final
{
private:
    std::any mPayload;
    EventType mType{EventType::None};
    EventPriority mPriority{EventPriority::Normal};

public:
    void setPayload(std::any tPayload)
    {
        auto nNewPayload = std::move(tPayload);
        mPayload = std::move(nNewPayload);
    }

    EventType getType() const
    {
        return mType;
    }
};
```
