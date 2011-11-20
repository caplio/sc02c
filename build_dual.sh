#!/bin/bash
#
# Allbase script :sc02c_kernel/blob/android-2.6.35.14-v1.5/mksc02c.sh  from sakuramilk
# merge AutoSign :Homura-kernel/blob/master/build_kernel_DCM.sh from HomuHomu

echo "SC-02C KERNEL IMAGE BUILD START!!!"

read -p "build? [(a)ll/(u)pdate/(z)Image default:update] " ANS

echo "copy initramfs..."
if [ -d /tmp/sc02c_initramfs ]; then
  rm -rf /tmp/sc02c_initramfs
fi

# cp initramfs to /tmp
#cp -a ../sc02c_initramfs /tmp/
cp -a ../dual/sc02c_initramfs /tmp/
rm -rf /tmp/sc02c_initramfs/.git
find /tmp/sc02c_initramfs -name .gitignore | xargs rm

# recovery_su into vendor
chmod 6755 /tmp/sc02c_initramfs/vendor/su/recovery_su

# make start
if [ "$ANS" = 'all' -o "$ANS" = 'a' ]; then
  echo "cleaning..."
  make clean
  make caplio_defconfig
fi

if [ "$ANS" != 'zImage' -a "$ANS" != 'z' ]; then
  echo "build start..."
  make -j2 2>&1 | tee `date +%Y_%m_%d_%s`_make.log
  if [ $? != 0 ]; then
    echo "NG make!!!"
    exit
  fi
  # *.ko replace
  find -name '*.ko' -exec cp -av {} /tmp/sc02c_initramfs/lib/modules/ \;
fi

# build zImage
echo "make zImage..."
make zImage

# release zImage
if [ ! -e out ]; then
  mkdir out
fi

# cp to ./out directory
cp arch/arm/boot/zImage ./out/

# make ODIN Image
OUTNAME=sc02c-custom_kernel-`date +%m%d_%s`

cd ./out
tar --format=ustar -cf $OUTNAME.tar zImage
md5sum -t $OUTNAME.tar >> $OUTNAME.tar
mv $OUTNAME.tar $OUTNAME.tar.md5

# make Install zip Image(add Autosing)

cp zImage ../Autosign/zImage
cd ../Autosign
cp Autosigned.zip $OUTNAME.zip
zip $OUTNAME.zip zImage

java -jar signapk.jar testkey.x509.pem testkey.pk8 $OUTNAME.zip ../out/$OUTNAME.zip

rm zImage
rm $OUTNAME.zip

ls -l ../out/

echo "SC-02C KERNEL IMAGE BUILD COMPLETE!!!"
