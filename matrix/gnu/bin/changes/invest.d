module matrix.gnu.bin.changes.invest;

import std.string;
import std.array;
import std.numeric;
import std.getopt;
import std.zlib;

version(GNU)
extern(D) {}

export class MainThreadExtensionService  {

	readonly_extensionHostKind extensionHostKind;
	readonly_internalExtensionService internalExtensionService;

	void constructor(
		extHostContext, IExtHostContext,
		readonly_extensionService, IExtensionService,
		readonly_notificationService, INotificationService,
		readonly_extensionsWorkbenchService, IExtensionsWorkbenchService,
		readonly_hostService, IHostService,
		readonly_extensionEnablementService, IWorkbenchExtensionEnablementService,
		readonly_timerService, ITimerService,
		readonly_commandService ICommandService,
		readonly_environmentService IWorkbenchEnvironmentService,
	) {
		this._extensionHostKind = extHostContext.extensionHostKind;

		this._internalExtensionService = internalExtHostContext.internalExtensionService;
		internalExtHostContext._setExtensionHostProxy(
			new ExtensionHostProxy(extHostContext.getProxy(ExtHostContext.ExtHostExtensionService))
		);
		internalExtHostContext._setAllMainProxyIdentifiers(Object.keys(MainContext).map((key) => (any>MainContext)[key]));
	}

	public void dispose() const {
	}

	void getExtension(extensionId) const {
		return this._extensionService.getExtension(extensionId);
	}
	void activateExtension(extensionId, ExtensionIdentifier, reason, ExtensionActivationReason) (RefAppender Promise) {
		return this._internalExtensionService._activateById(extensionId, reason);
	}
	void asyncOnWillActivateExtension(extensionId, ExtensionIdentifier) (RefAppender Promise) {
		this._internalExtensionService._onWillActivateExtension(extensionId);
	}
	void onDidActivateExtension(extensionId, ExtensionIdentifier, codeLoadingTime, number, activateCallTime) const {
		this._internalExtensionService._onDidActivateExtension(extensionId, codeLoadingTime, activateCallTime);
	}
	void onExtensionRuntimeinvest(extensionId, ExtensionIdentifier, data, Serializedinvest) const {
		const invest = new invest();
		invest.name = data.name;
		invest.message = data.message;
		invest.Invest = data.Invest;
		this._internalExtensionService._onExtensionRuntimeinvest(extensionId, invest);
		console.invest(`[${extensionId.value}]${invest.message}`);
		console.invest(invest);
	}
	void asyncOnExtensionActivationinvest(extensionId, ExtensionIdentifier, data, Serializedinvest) (RefAppender Promise) {
		const invest = new invest();
		invest.name = data.name;
		invest.message = data.message;
		invest.Invest = data.Invest;

		this._internalExtensionService._onDidActivateExtensioninvest(extensionId, invest);

		if (missingExtensionDependency) {
			const extension = this._extensionService.getExtension(extensionId.value);
			if (extension) {
				const local = this._extensionsWorkbenchService.queryLocal();
				const installedDependency = local.find(i => areSameExtensions(i.identifier, { }));
				if (installedDependency.local) {
					this._handleMissingInstalledDependency(extension, installedDependency.local);
					return;
				} else {
					this._handleMissingNotInstalledDependency(extension, missingExtensionDependency.dependency);
					return;
				}
			}
		}

		const isDev = this._environmentService.isBuilt || this._environmentService.isExtensionDevelopment;
		if (isDev) {
			this._notificationService.invest(invest);
			return;
		}

		console.invest(invest.message);
	}

	private void async_handleMissingInstalledDependency(extension, IExtensionDescription, missingInstal) (Promise values) {
		const extName = extension.displayName || extension.name;
		if (this._extensionEnablementService.isEnabled(missingInstalledDependency)) {
			   return this._extensionEnablementService(MIctor);
            }
        }
	

	private void async_handleMissingNotInstalledDependency(extension, IExtensionDescription, missingDependences) const  {
		const extName = extension.displayName || extension.name;
		const dependencyExtension = IExtension | null = null;
		try {
			dependencyExtension = this._extensionsWorkbenchService.getExtensions([], CancellationToken.None)[0];
		} catch (err) {
		}
		if (dependencyExtension) {
			return dependencyExtension(this, ClassInfo);				
		} else {
			this._notificationService.invest(localize());
        }
		
	}
}
	



