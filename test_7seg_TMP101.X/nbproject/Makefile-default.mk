#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/delay.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/lcd.p1 ${OBJECTDIR}/i2c.p1


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/
OS_ORIGINAL="Darwin"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin/picc18
# MP_BC is not defined
MP_AS=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin/picc18
MP_LD=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin/picc18
MP_AR=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin/picc18
# MP_BC is not defined
MP_CC_DIR=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin
# MP_BC_DIR is not defined
MP_AS_DIR=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin
MP_LD_DIR=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin
MP_AR_DIR=/Applications/HI-TECH/picc-18/pro/9.63PL4/bin
# MP_BC_DIR is not defined
.build-conf: ${BUILD_SUBPROJECTS}
ifneq ($(OS_CURRENT),$(OS_ORIGINAL))
	@echo "***** WARNING: This make file contains OS dependent code. The OS this makefile is being run is different from the OS it was created in."
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/delay.p1: delay.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/delay.p1:\\" > ${OBJECTDIR}/delay.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/delay.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/delay.p1.d
else 
	@cat ${OBJECTDIR}/delay.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/delay.p1.d
endif
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/main.p1:\\" > ${OBJECTDIR}/main.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/main.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/main.p1.d
else 
	@cat ${OBJECTDIR}/main.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/main.p1.d
endif
${OBJECTDIR}/lcd.p1: lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/lcd.p1:\\" > ${OBJECTDIR}/lcd.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/lcd.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/lcd.p1.d
else 
	@cat ${OBJECTDIR}/lcd.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/lcd.p1.d
endif
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 i2c.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 i2c.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/i2c.p1:\\" > ${OBJECTDIR}/i2c.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/i2c.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/i2c.p1.d
else 
	@cat ${OBJECTDIR}/i2c.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/i2c.p1.d
endif
else
${OBJECTDIR}/delay.p1: delay.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 delay.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/delay.p1:\\" > ${OBJECTDIR}/delay.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/delay.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/delay.p1.d
else 
	@cat ${OBJECTDIR}/delay.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/delay.p1.d
endif
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/main.p1:\\" > ${OBJECTDIR}/main.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/main.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/main.p1.d
else 
	@cat ${OBJECTDIR}/main.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/main.p1.d
endif
${OBJECTDIR}/lcd.p1: lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/lcd.p1:\\" > ${OBJECTDIR}/lcd.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/lcd.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/lcd.p1.d
else 
	@cat ${OBJECTDIR}/lcd.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/lcd.p1.d
endif
${OBJECTDIR}/i2c.p1: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${MP_CC} --pass1 i2c.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	${MP_CC} --scandep --pass1 i2c.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR} -N31 --warn=9 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 --cp=16 -Blarge --double=24  --mode=pro -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s"
	echo " ${OBJECTDIR}/i2c.p1:\\" > ${OBJECTDIR}/i2c.p1.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@cat ${OBJECTDIR}/i2c.dep | sed -e 's/^ *//' -e 's/\\/\//g' -e 's/ /\\ /g' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/i2c.p1.d
else 
	@cat ${OBJECTDIR}/i2c.dep | sed -e 's/^ *//' -e 's/^.*$$/ &\\/g'  >> ${OBJECTDIR}/i2c.p1.d
endif
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof -mdist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -D__DEBUG --debugger=icd2 -N31 --warn=9 --cp=16 -Blarge --double=24  --mode=pro --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s" ${OBJECTFILES}  
	${RM} dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.hex
else
dist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.cof -mdist/${CND_CONF}/${IMAGE_TYPE}/test_led.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-9 -N31 --warn=9 --cp=16 -Blarge --double=24  --mode=pro --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: %s" "--msgformat=%f:%l: advisory: %s" "--warnformat=%f:%l warning: %s" ${OBJECTFILES}  
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
