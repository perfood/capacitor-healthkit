var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { WebPlugin } from '@capacitor/core';
export class CapacitorHealthkitWeb extends WebPlugin {
    constructor() {
        super({
            name: 'CapacitorHealthkit',
            platforms: ['web']
        });
    }
    requestAuthorization() {
        return __awaiter(this, void 0, void 0, function* () {
            throw new Error("Method not implemented.");
        });
    }
    isAvailable() {
        return __awaiter(this, void 0, void 0, function* () {
            throw new Error("Method not implemented.");
        });
    }
    queryHKitSampleType() {
        return __awaiter(this, void 0, void 0, function* () {
            throw new Error("Method not implemented.");
        });
    }
}
const CapacitorHealthkit = new CapacitorHealthkitWeb();
export { CapacitorHealthkit };
import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapacitorHealthkit);
//# sourceMappingURL=web.js.map