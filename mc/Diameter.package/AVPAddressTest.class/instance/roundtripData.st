accessing
roundtripData
	^ Array
		with: { #[0 1 127 0 0 1]. SocketAddress newFrom: #[127 0 0 1]. }