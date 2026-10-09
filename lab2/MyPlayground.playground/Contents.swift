	
class Person {
    var name: String
    var surname: String?
    var age: Int?

    init(name: String, surname: String?, age: Int?) {
        self.name = name
        self.surname = surname
        self.age = age
    }

    func showInfo() {
        print("Ім'я: \(name)")
        print("Прізвище: \(surname ?? "невідоме")")
        
        guard let age = age else {
            print ("Вік невідомий:")
            return
        }
        print("Вік \(age)")
    }

    func greet() {
        greetPerson(person: self)
    }
}

func greetingText(person: Person) -> String {
    var text = "Привіт, " + person.name

    if let surname = person.surname {
        text = text + " " + surname
    }

    if let age = person.age {
        text = text + "! Тобі \(age) років."
    } else {
        text = text + "! Твій вік невідомий."
    }

    return text
}

func greetPerson(person: Person) {
    print(greetingText(person: person))
}

struct Address {
    var street: String
    var city: String
    var postalCode: Int?

    func showAddress() {
        print("Місто: \(city)")
        print("Вулиця: \(street)")

        if let postalCode = postalCode {
            print("Індекс: \(postalCode)")
        } else {
            print("Індекс невідомий")
        }
    }
}

func printAddress(address: Address) {
    address.showAddress()
}

enum JobPosition {
    case developer
    case designer
    case manager
}

class Employee: Person {
    var position: String
    var address: Address
    var jobPosition: JobPosition

    init(
        name: String,
        surname: String?,
        age: Int?,
        position: String,
        address: Address,
        jobPosition: JobPosition
    ) {
        self.position = position
        self.address = address
        self.jobPosition = jobPosition

        super.init(name: name, surname: surname, age: age)
    }

    func showEmployee() {
        showInfo()
        print("Посада: \(position)")

        switch jobPosition {
        case .developer:
            print("Категорія: розробник")
        case .designer:
            print("Категорія: дизайнер")
        case .manager:
            print("Категорія: менеджер")
        }

        address.showAddress()
    }
}

let person1 = Person(
    name: "Денис",
    surname: "Коваленко",
    age: 19
)

let person2 = Person(
    name: "Олена",
    surname: nil,
    age: 20
)

let person3 = Person(
    name: "Андрій",
    surname: "Мельник",
    age: nil
)

let person4 = Person(
    name: "Марія",
    surname: nil,
    age: nil
)

let people = [person1, person2, person3, person4]

print("Інформація про людей")

for person in people {
    person.showInfo()

    greetPerson(person: person)

    person.greet()
}

let address1 = Address(
    street: "вул. Шевченка, 10",
    city: "Київ",
    postalCode: 1010
)

var address2 = address1
address2.city = "Львів"
address2.postalCode = nil

print("Початкова адреса")
printAddress(address: address1)

print("Змінена копія")
printAddress(address: address2)

let employee1 = Employee(
    name: "Денис",
    surname: "Коваленко",
    age: 19,
    position: "Swift Developer",
    address: address1,
    jobPosition: .developer
)

let employee2 = Employee(
    name: "Олена",
    surname: nil,
    age: 20,
    position: "UI Designer",
    address: address2,
    jobPosition: .designer
)

let employee3 = Employee(
    name: "Андрій",
    surname: "Мельник",
    age: nil,
    position: "Project Manager",
    address: address1,
    jobPosition: .manager
)

let employees = [employee1, employee2, employee3]

print("Інформація про працівників")

for employee in employees {
    employee.showEmployee()
}

if let age = person1.age {
    let ageAsDouble = Double(age)
    print("Вік як Double: \(ageAsDouble)")
}

