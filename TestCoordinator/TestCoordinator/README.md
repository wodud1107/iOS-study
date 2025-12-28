# Coordinator Pattern 학습 예제

UIKit 기반의 iOS 앱에서 발생할 수 있는 **Massive ViewController 문제를 해결하고, 화면 흐름(Navigation Flow)을 효율적으로 관리**하기 위해 Coordinator 패턴을 학습하고 적용해 본 예제입니다.

## 🤔 문제 인식: "왜 ViewController가 화면 이동까지 책임져야 하는가?"

전통적인 MVC 패턴에서는 `ViewController`가 다른 `ViewController`를 직접 생성하고 화면을 전환시키는 책임을 가집니다. 이는 다음과 같은 문제점을 야기합니다.

1.  **높은 결합도:** `ViewController`들이 서로를 알아야 하므로 의존성이 복잡해집니다.
2.  **재사용성 저하:** 특정 화면 흐름에 종속된 `ViewController`는 다른 곳에서 재사용하기 어렵습니다.
3.  **Massive ViewController:** 화면 전환 로직이 계속 추가되면서 `ViewController`가 비대해집니다.
4.  **테스트의 어려움:** 화면 흐름 로직을 테스트하기가 까다롭습니다.

이 프로젝트는 이러한 문제들을 **Coordinator Pattern**을 통해 어떻게 해결할 수 있는지 보여주는 것을 목표로 합니다.

## 💡 해결 방안: Coordinator Pattern 적용

`Coordinator`는 '조정자'라는 의미 그대로, 화면 흐름 제어의 책임을 `ViewController`로부터 분리하여 중앙에서 관리하는 별도의 객체입니다.

이 예제는 다음과 같은 구조로 이루어져 있습니다.

* **`AppCoordinator`**: 앱의 시작점. 윈도우와 최상위 내비게이션 컨트롤러를 설정하고, 첫 번째 자식 코디네이터인 `ListCoordinator`를 시작시킵니다.
* **`ListCoordinator`**: '목록' 화면의 흐름을 책임집니다. '상세' 화면으로 이동해야 할 때, `DetailCoordinator`를 생성하고 시작시킵니다.
* **`DetailCoordinator`**: '상세' 화면의 흐름을 책임집니다.
* **`Coordinator` 프로토콜**: 모든 코디네이터가 공통적으로 따르는 인터페이스로, `start()` 메서드를 통해 각자의 흐름을 시작합니다.

이 구조를 통해 `ViewController`는 "상세 화면으로 가고 싶어"라고 `Coordinator`에게 요청만 할 뿐, 다음 화면이 무엇인지, 어떻게 생성되는지에 대해서는 전혀 알 필요가 없게 됩니다.

## 🚀 실행 방법

1.  `TestCoordinator.xcodeproj` 파일을 Xcode로 엽니다.
2.  시뮬레이터 또는 실제 기기를 선택하고 실행합니다. (cmd + R)

## ✅ 학습 내용

* `ViewController`의 책임을 분리하여 코드의 **결합도를 낮추고 응집도를 높이는 방법**.
* 화면 흐름 로직을 중앙에서 관리하여 **유지보수성과 확장성을 향상**시키는 아키텍처 설계.
* 프로토콜 기반 설계를 통해 **유연하고 테스트하기 쉬운 코드**를 작성하는 능력.