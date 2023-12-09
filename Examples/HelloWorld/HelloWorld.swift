import Libadwaita

@main
class HelloWorld: AdwApplication {
    override func activate() {
        print("Hello Adwaita")
    }

    static func main() {
        let app = HelloWorld("com.example.HelloWorld")
        app.run()
    }
}
