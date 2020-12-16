.PHONY: clean clean-keep
.DEFAULT_GOAL := clean

clean: clean-keep

clean-keep:
	find . -name '.keep' -exec rm -fr {} +

