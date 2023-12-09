import CAdwHelper
import CLibadwaita
import Foundation

/// A base class for Adwaita applications.
/// Reference: https://gnome.pages.gitlab.gnome.org/libadwaita/doc/1.4/class.Application.html
open class AdwApplication {
    let applicationPtr: UnsafeMutablePointer<CLibadwaita.AdwApplication>

    public init(_ id: String) {
        applicationPtr = adw_application_new(id, G_APPLICATION_DEFAULT_FLAGS)
    }

    open func activate() {}

    @discardableResult
    public func run() -> Int32 {
        let callback:
            @convention(c) (
                UnsafeMutableRawPointer,
                UnsafeMutableRawPointer
            ) -> Void = { appPtr, data in
                let app = unsafeBitCast(data, to: AdwApplication.self)
                app.activate()
            }

        g_signal_connect_data(
            applicationPtr,
            "activate",
            unsafeBitCast(callback, to: GCallback.self),
            Unmanaged.passUnretained(self).toOpaque(),
            nil,
            GConnectFlags(0)
        )

        let app = swadw_g_application_from_adw_application(applicationPtr)
        return g_application_run(app, 0, nil)
    }
}
