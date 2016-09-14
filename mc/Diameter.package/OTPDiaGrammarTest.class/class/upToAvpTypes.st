as yet unclassified
upToAvpTypes
	^String streamContents: [:str |
		str
			nextPutAll: ';; Copyright Ericsson AB 2013. All Rights Reserved.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; The contents of this file are subject to the Erlang Public License,'; lf;
			nextPutAll: ';; Version 1.1, (the "License"); you may not use this file except in'; lf;
			nextPutAll: ';; compliance with the License. You should have received a copy of the'; lf;
			nextPutAll: ';; Erlang Public License along with this software. If not, it can be'; lf;
			nextPutAll: ';; retrieved online at http://www.erlang.org/.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; Software distributed under the License is distributed on an "AS IS"'; lf;
			nextPutAll: ';; basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See'; lf;
			nextPutAll: ';; the License for the specific language governing rights and limitations'; lf;
			nextPutAll: ';; under the License.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; %CopyrightEnd%'; lf;
			nextPutAll: ';;'; lf;
			lf;
			nextPutAll: '@id 0'; lf;
			nextPutAll: '@name   diameter_gen_base_rfc6733'; lf;
			nextPutAll: '@prefix diameter_base'; lf;
			nextPutAll: '@vendor 0 IETF'; lf;
			yourself].