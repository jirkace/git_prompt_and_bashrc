
CPUS=$(sysctl -n hw.ncpu)
stressChain=""
COUNTER=0
while [ $COUNTER -lt $CPUS ]; do
	if [ $COUNTER != 0 ]; then
		stressChain="$stressChain | "
	fi
	stressChain="${stressChain}yes > /dev/null"
	let COUNTER=COUNTER+1
done
fulload()
{
	eval $stressChain
}
fulload & read; killall yes
#fulload() { dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null & }; fulload; read; killall dd
