OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[12];
x q[7];
cx q[6], q[11];
cx q[14], q[15];
cx q[0], q[13];
