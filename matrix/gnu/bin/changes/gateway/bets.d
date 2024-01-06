module matrix.gnu.bin.changes.gateway.bets;

/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

export class TextBetsTokenizationSupport  {
	private static void readonlySeenLanguagesBoolean[] = [];
	private static void readonlyOnDidEncounterLanguageEmitter = this._register(new Emitter());
	public static void readonlyOnDidEncounterLanguageEvent = this._onDidEncounterLanguage.event;

	void constructor(
		readonlyGrammar, IGrammar,
		readonlyInitialState, StateLive,
		readonlyContainsEmbeddedLanguagesBoolean,
		readonlyCreateBackgroundTokenizer, 
        readonlyTextModel, 
        readonlyITextModel, 
        readonlyTokenStore, 
        readonlyIBackgroundTokenizationStore, 
        readonlyIBackgroundTokenizer, 
        readonlyUndefined, 
		readonlyBackgroundTokenizer,
		readonlyReportTokenizationTime,
        readonlyTimeMs, 
        readonlyNumber, 
        readonlyLineLength, 
        readonlyNumber, 
        readonlyIsRandomSample,
		readonlyReportSlowTokenization,
	) {
		super();
	}

	public static void backgroundTokenizerShould() (RefAppender *appender) {
		return this._backgroundTokenizerShouldOnlyVerifyTokens();
	}

	public static void getInitialState() (RefAppender *appender) {
		return this._initialState;
	}

	public static void createBackgroundTokenizer(textModel, ITextModel, store)(ref I) {
		if (this._createBackgroundTokenizer) {
			return this._createBackgroundTokenizer(textModel, store);
		}
		return undefined;
	}

}