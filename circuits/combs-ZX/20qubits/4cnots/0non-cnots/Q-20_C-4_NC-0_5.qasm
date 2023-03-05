OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[11], q[7];
cx q[5], q[12];
cx q[12], q[0];
