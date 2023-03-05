OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[3];
cx q[13], q[18];
x q[8];
cx q[13], q[7];
cx q[18], q[15];
