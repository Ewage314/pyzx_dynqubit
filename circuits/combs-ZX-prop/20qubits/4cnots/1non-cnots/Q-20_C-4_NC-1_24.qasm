OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[0];
cx q[7], q[5];
cx q[18], q[12];
cx q[13], q[4];
cx q[11], q[4];
