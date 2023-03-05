OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[7];
cx q[15], q[5];
cx q[14], q[18];
z q[10];
cx q[18], q[8];
