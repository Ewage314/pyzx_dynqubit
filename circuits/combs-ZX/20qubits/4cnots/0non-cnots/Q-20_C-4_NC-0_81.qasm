OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[13];
cx q[0], q[14];
cx q[0], q[18];
cx q[11], q[17];
