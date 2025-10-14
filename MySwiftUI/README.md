# SwiftUI 시작해보기

SwiftUI를 학습하면서 데이터 흐름을 제대로 파악하기 위해 @StateObject와 @ObservedObject의 차이를 알기 위해서 만들어본 예제입니다.

## 학습내용
### CounterViewModel

Increment 버튼을 클릭하여 count를 증가시키는 비즈니스 로직을 포함합니다.

### CorrectStateObjectView

ViewModel의 생명주기를 관리하는 @StateObject 프로퍼티 래퍼를 통해 ViewModel 인스턴스를 소유하고 관리하여 올바른 사용을 이해합니다.

### WrongObservedObjectView

ViewModel을 @ObservedObject로 넘겨받아 뷰가 다시 그려질 때마다 ViewModel 인스턴스를 초기화하는 잘못된 사용을 이해합니다.

---
각 뷰들은 LifecycleTestContainerView에서 토글에 의해 생성되고 파괴됩니다. 각 뷰가 생성 및 파괴되는 과정에서 ViewModel 인스턴스의 생명주기가 어떻게 동작하는지 학습할 수 있었습니다.